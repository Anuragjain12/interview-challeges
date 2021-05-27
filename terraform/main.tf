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
    },
    {
        name="filename8"
       content="content10"
    }
]

    # default = [{
    #     name="filename1"
    #     content="content1"
    # },{
    #     name="filename2"
    #     content="content2"
    # }]
}

resource "local_file" "files1" {
    #for_each = var.files
   #{for val in var.files : val.name => val}
    for_each = {for val in var.files : val.name => val}
    content  = each.value.content
    filename = "./test-${each.value.name}"
}
