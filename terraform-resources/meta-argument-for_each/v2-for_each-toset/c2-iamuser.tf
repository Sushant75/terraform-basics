# Create 4 IAM Users

resource "aws_iam_user" "myuser" {
  for_each = toset(["TJack", "TJames", "TMadhu", "TDave"])
  name     = each.key # both each.key & each.value will generate the same result
}