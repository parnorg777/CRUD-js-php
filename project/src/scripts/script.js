const btnCreatePost = document.querySelector("#create-post-btn");
const formModalWin = document.querySelector("#form-modal-win");
const postModalWin = document.querySelector("#post-modal-win");

const postID = document.querySelector("#post-id");

const form = document.forms[0];

class CRUD {
  static getPostID(event) {
    const target = event.target;
    const tdElem = target.parentElement.parentElement.firstElementChild;
    const id = tdElem.textContent;
    return id;
  }

  static async getData(url) {
    const response = await fetch(url);
    const data = await response.json();
    return data;
  }

  static async sendData(url, data) {
    const response = await fetch(url, {
      method: "POST",
      headers: { "Content-type": "application/x-www-form-urlencoded" },
      body: `data=${JSON.stringify(data)}`,
    });
    const getData = await response.json();
    return getData;
  }

  static async addPost() {
    const inputs = [form.title, form.text, form.likes];

    let script = null;

    if (form.id.value) {
      script = "scripts/editpost.php";
    } else {
      script = "scripts/addpost.php";
    }

    if (Form.validForm(inputs) == true) {
      const data = {
        post: Form.getFormData(),
        limit: Pagination.getLimit(),
      };
      const getData = await CRUD.sendData(script, data);
      CRUD.renderPosts(getData.posts);

      formModalWin.style.display = "none";
      Form.clearForm();

      if (script == "scripts/addpost.php") {
        await Pagination.changeLustPage();
      } else {
        await Pagination.renderPaginate();
      }

      const post = await CRUD.sendData("scripts/getpost.php", getData.postID);
      PostWindow.renderPostWin(post);
      postModalWin.style.display = "flex";
    }
  }

  static editPost = async (e) => {
    const postID = CRUD.getPostID(e);
    const post = await CRUD.sendData("scripts/getpost.php", postID);
    Form.pushDataInForm(post);
    ModalWin.openWinForm();
  };

  static deletePost = async (e) => {
    const data = {
      post_id: CRUD.getPostID(e),
      limit: Pagination.getLimit(),
    };
    const posts = await CRUD.sendData("scripts/deletepost.php", data);
    const pages = await Pagination.getPages();
    if (Pagination.page > pages) {
      Pagination.changeLustPage();
    } else {
      CRUD.renderPosts(posts);
      await Pagination.renderPaginate();
    }
  };

  static renderPosts(posts) {
    const tbody = document.querySelector("table").tBodies[0];

    while (tbody.firstChild) {
      tbody.removeChild(tbody.lastChild);
    }

    for (let post of posts) {
      const tr = document.createElement("tr");

      const id = document.createElement("td");
      id.textContent = post.id;
      tr.append(id);

      const title = document.createElement("td");
      const link = document.createElement("a");
      link.href = "";
      link.textContent = post.title;
      link.addEventListener("click", ModalWin.openWinPost);
      title.append(link);
      tr.append(title);

      const likes = document.createElement("td");
      likes.textContent = post.likes;
      tr.append(likes);

      const category = document.createElement("td");
      category.textContent = post.category;
      tr.append(category);

      const editTd = document.createElement("td");
      const btnRedact = document.createElement("button");
      btnRedact.classList.add("btn", "btn-redact");
      btnRedact.textContent = "Редакт.";
      btnRedact.addEventListener("click", CRUD.editPost);
      editTd.append(btnRedact);
      tr.append(editTd);

      const deleteTd = document.createElement("td");
      const btnDelete = document.createElement("button");
      btnDelete.classList.add("btn", "btn-delete");
      btnDelete.textContent = "Удалить";
      btnDelete.addEventListener("click", CRUD.deletePost);
      deleteTd.append(btnDelete);
      tr.append(deleteTd);

      tbody.append(tr);
    }
  }
}

class Form {
  static clearForm() {
    form.id.value = "";
    form.title.value = "";
    form.text.value = "";
    form.likes.value = "";
    form.category.selectedIndex = 0;

    for (let tag of form.tags) {
      tag.checked = false;
    }

    const errors = document.querySelectorAll(".error");
    for (let error of errors) {
      error.querySelector(".p-error").remove();
      error.classList.remove("error");
    }
  }

  static validForm(inputs) {
    function createError(inp, textError) {
      const errEl = document.createElement("p");
      errEl.classList.add("p-error");
      errEl.textContent = textError;

      const inpBox = inp.parentElement;
      inpBox.classList.add("error");
      inpBox.append(errEl);
    }

    function removeError(inp) {
      const inpBox = inp.parentElement;

      if (inpBox.closest(".error")) {
        inpBox.querySelector(".p-error").remove();
        inpBox.classList.remove("error");
      }
    }

    let validation = true;

    for (let inp of inputs) {
      removeError(inp);

      if (inp.dataset.positiveNum == "true") {
        if (inp.value < 0) {
          removeError(inp);
          createError(inp, "Введите число не меньше «0»!");
          validation = false;
        }
      }

      if (inp.dataset.maxLength) {
        if (inp.value.length > inp.dataset.maxLength) {
          removeError(inp);
          createError(
            inp,
            `Максимальное количество символов ${inp.dataset.maxLength}`
          );
          validation = false;
        }
      }

      if (inp.dataset.minLength) {
        if (inp.value.length < inp.dataset.minLength) {
          removeError(inp);
          createError(
            inp,
            `Минимальное количество символов ${inp.dataset.minLength}`
          );
          validation = false;
        }
      }

      if (inp.dataset.required == "true") {
        if (inp.value == "") {
          removeError(inp);
          createError(inp, "Поле не заполнено!");
          validation = false;
        }
      }
    }

    return validation;
  }

  static renderForm(categories, tags) {
    const select = document.querySelector("#category");

    for (let category of categories) {
      const option = document.createElement("option");
      option.value = category.id;
      option.textContent = category.title;
      select.append(option);
    }

    const formTags = document.querySelector("#form-tags");

    for (let tag of tags) {
      const div = document.createElement("div");
      div.classList.add("tag-box");

      const p = document.createElement("p");
      p.textContent = tag.title;
      div.append(p);

      const input = document.createElement("input");
      input.type = "checkbox";
      input.value = tag.id;
      input.name = "tags";
      div.append(input);

      formTags.append(div);
    }
  }

  static getFormData() {
    let tags = [];
    for (let tag of form.tags) {
      if (tag.checked == true) {
        tags.push(tag.value);
      }
    }

    let data = {
      id: form.id.value,
      title: form.title.value,
      post_text: form.text.value,
      likes: form.likes.value,
      category_id: form.category.value,
      tags: tags,
    };

    return data;
  }

  static pushDataInForm(post) {
    form.id.value = post.id;
    form.title.value = post.title;
    form.text.value = post.post_text;
    form.likes.value = post.likes;

    const options = form.category.querySelectorAll("option");

    for (let opt of options) {
      if (opt.value == post.category_id) {
        opt.selected = true;
      }
    }

    const checkboxes = form.tags;

    for (let checkbox of checkboxes) {
      for (let tag of post.tags)
        if (checkbox.value == tag.tag_id) {
          checkbox.checked = true;
        }
    }
  }
}

class PostWindow {
  static renderPostWin(post) {
    const postTitle = document.querySelector("#post-title");
    const postID = document.querySelector("#post-id");
    const postText = document.querySelector("#post-text");
    const postLikes = document.querySelector("#post-likes");
    const postCategory = document.querySelector("#post-category");
    const postTags = document.querySelector("#post-tags");

    postTitle.textContent = post.title;
    postID.textContent = post.id;
    postText.textContent = post.post_text;
    postLikes.textContent = post.likes;
    postCategory.textContent = post.category;

    while (postTags.firstChild) {
      postTags.removeChild(postTags.lastChild);
    }

    for (let tag of post.tags) {
      const span = document.createElement("span");
      span.textContent = tag.tag_name;
      span.classList.add("tag");
      postTags.append(span);
    }
  }
}

class ModalWin {
  static openWinForm = () => {
    formModalWin.style.display = "flex";
  };

  static closeWinForm = (e) => {
    const target = e.target;

    if (target === formModalWin || target.closest(".btn-close-win")) {
      formModalWin.style.display = "none";
      Form.clearForm();
    }
  };

  static openWinPost = async (e) => {
    e.preventDefault();

    const postID = CRUD.getPostID(e);

    const post = await CRUD.sendData("scripts/getpost.php", postID);
    PostWindow.renderPostWin(post);

    postModalWin.style.display = "flex";
  };

  static closeWinPost = (e) => {
    const target = e.target;

    if (target === postModalWin || target.closest(".btn-close-win")) {
      postModalWin.style.display = "none";
    }
  };
}

class Pagination {
  static page = 1;
  static entriesOnPage = 18;
  static fromOnPages = 0;

  static async renderPaginate() {
    const pages = await Pagination.getPages();

    const ul = document.querySelector("#pagination ul");

    while (ul.firstChild) {
      ul.removeChild(ul.lastChild);
    }

    if (pages > 1) {
      for (let i = 1; i <= pages; i++) {
        const li = document.createElement("li");

        li.textContent = i;

        const className = Pagination.page == i ? "active" : "no-active";
        li.className = className;

        li.addEventListener("click", Pagination.changePage);

        ul.append(li);
      }
    }
  }

  static async getPages() {
    const data = await CRUD.getData("scripts/getcount.php");
    const countEntries = data[0].count;
    const pages = Math.ceil(countEntries / Pagination.entriesOnPage);
    return pages;
  }

  static changePage = async (e) => {
    const target = e.target;

    Pagination.page = target.textContent;
    Pagination.fromOnPages = (Pagination.page - 1) * Pagination.entriesOnPage;

    const posts = await CRUD.sendData(
      "scripts/getposts.php",
      Pagination.getLimit()
    );
    CRUD.renderPosts(posts);

    Pagination.renderPaginate();
  };

  static getLimit() {
    const limit = {
      from: Pagination.fromOnPages,
      entries: Pagination.entriesOnPage,
    };

    return limit;
  }

  static async changeLustPage() {
    Pagination.page = await Pagination.getPages();

    Pagination.fromOnPages = (Pagination.page - 1) * Pagination.entriesOnPage;

    const posts = await CRUD.sendData(
      "scripts/getposts.php",
      Pagination.getLimit()
    );
    CRUD.renderPosts(posts);

    Pagination.renderPaginate();
  }
}

btnCreatePost.addEventListener("click", ModalWin.openWinForm);
formModalWin.addEventListener("click", ModalWin.closeWinForm);
postModalWin.addEventListener("click", ModalWin.closeWinPost);

form.addEventListener("submit", (e) => {
  e.preventDefault();
  CRUD.addPost();
});

window.addEventListener("load", async () => {
  const posts = await CRUD.sendData(
    "scripts/getposts.php",
    Pagination.getLimit()
  );
  CRUD.renderPosts(posts);
  await Pagination.renderPaginate();
  const categories = await CRUD.getData("scripts/getcategories.php");
  const tags = await CRUD.getData("scripts/gettags.php");
  Form.renderForm(categories, tags);
});
