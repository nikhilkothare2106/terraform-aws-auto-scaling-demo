output "eips" {
  value = {
    for key, eip in aws_eip.eips :
    key => {
      id = eip.id
    }
  }
}
