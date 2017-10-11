"key" = {
  "" = {
    "policy" = "read"
  }
}

"key" = {
  "foo/" = {
    "policy" = "write"
  }
}

"key" = {
  "foo/bar/" = {
    "policy" = "read"
  }
}

"key" = {
  "foo/bar/baz" = {
    "policy" = "deny"
  }
}

"output" = {
  "many" = "${replace(var.sub_domain, \".\", \"\\.\")}"

  "one" = "${replace(var.sub_domain, \".\", \"\\.\")}"

  "two" = "${replace(var.sub_domain, \".\", \"\\.\")}"
}