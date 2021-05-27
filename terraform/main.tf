terraform {
    required_version = ">= 0.13.0"
}

variable "files" {
    type = list(map(string))
    default = [
    {
        name="filename0"
        content="content0"
    },
    {
        name="filename1"
        content="content1"
    },{
        name="filename2"
        content="content2"
    },{
        name="filename3"
        content="content5"
    },
   # {
   #     name="filename6"
   #     content="content6"
   # },
    {
        name="filename4"
        content="content4"
    },
    {
        name="filename7"
        content="content7"
    }
    #{
    #    name="filename8"
   #     content="content8"
   # }
]

    # default = [{
    #     name="filename1"
    #     content="content1"
    # },{
    #     name="filename2"
    #     content="content2"
    # }]
}

#data "local_file" "new" {
#count    = length(var.files)
#resource "local_file" "files1" {
#count = length("./test-${var.files[count.index].name}") > 0 ? 0 : 1
#filename = "./test-${var.files[count.index].name}"
#content  = var.files[count.index].content
#}
#}
#resource "local_file" "files1" {
#    count    = length(var.files)
    #content  = var.files[count.index].content
    #count = "./test-${var.files[count.index].name}" ? 0 : 1
    #length("./test-${var.files[count.index].name}") > 0 ? [] : [filename = "./test-${var.files[count.index].name}" && content  = var.files[count.index].content]
    #content  = var.files[count.index].content
    #filename = "./test-${var.files[count.index].name}"
#    fileexists("./test-${var.files[count.index].name}") == true ? 0 : 1
#}

resource "local_file" "files1" {
    count    = length(var.files)
    content  = var.files[count.index].content
    filename = "./test-${var.files[count.index].name}"
}

data "local_file" "files1_bar" {
  count    = length(var.files)
  filename   = "./test-${var.files[count.index].name}"
  depends_on = ["local_file.files1"]
}

resource "null_resource" "new" {
  count    = length(var.files)
  triggers = {
    files_file = "${data.local_file.files1_bar[count.index].content}"
  }
}
