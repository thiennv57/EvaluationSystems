function remove_fields(link) {
  // $(link).prev("input[type=hidden]").val("1");
  // $(link).closest("tr").hide();
  $(link).closest("div.form-group").remove();
}
