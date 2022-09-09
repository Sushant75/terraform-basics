resource "local_file" "pet" {
  filename = "$PWD/pets.txt"
  content = "We love pets!"
  file_permission = "0700"
}