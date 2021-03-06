document.addEventListener("DOMContentLoaded", () => {
  const day_select = document.querySelector("select.dayset");
  const day_table = document.querySelector("table.dayset");

  day_select?.addEventListener("change", (e) => {
    const current = e.currentTarget;
    const sc_num = current.dataset.sc_num;
    const sc_id = current.value;

    document.location.href = `${rootPath}/user/dayset/${sc_num}/${sc_id}`;
  });

  day_table?.addEventListener("click", (e) => {
    const target = e.target;
    if (target.tagName === "TD") {
      const tr = target.closest("TR");
      const list_id = tr.dataset.list_id;
      const sc_id = tr.dataset.sc_id;

      document.location.href = `${rootPath}/user/dayHealth/${sc_id}/${list_id}`;
    }
  });
});
