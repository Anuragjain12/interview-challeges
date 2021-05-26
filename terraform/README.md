# mini 'broken' terraform example

This terraform main.tf file will do following things:
1) If the content of the existing file is chnaged then only that file will be modified and for that "null_resource" has been used which will triggeronly when the resource is being chnaged.
2) If a new file is added then it will just add that particular file in local and no changes or replcamenet will happen for existing files.

The null_resource resource implements the standard resource lifecycle but takes no further action.

The triggers argument allows specifying an arbitrary set of values that, when changed, will cause the resource to be replaced.

Data sources are special resource types that read an existing object or compute a result, rather than creating and managing a new object. Because they are resources, they can participate in the dependency graph and can thus make use of objects (including local files) that are created by other resources in the same Terraform configuration during terraform apply.
