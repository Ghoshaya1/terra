## Assignment

This assignment is meant to be done in a local environment and not against real Azure backend.

Imagine that the actual Terraform pipeline would use tfvars from `terraform/environments` as input variables when running `plan` and `apply` commands.

Refactor Postgres module/module call:

- By default, one postgres instance should be created for each environment. However, there should be easy way to create multiple Postgres instances with different SKU's and Postgres versions if needed.
  - For example - `dev1` just requires one Postgres instance with default values. `prod1` requires another Postgres instance with same SKU, but with version 15. SKU, version and storage size should be configuragable.
  - Note: that while this example requires one additional instance of Postgres to `prod1`, the solution should be able to handle adding and removing instances as needed flexibly.
- Save postgres admin user password to Key Vault provisioned by the Terraform.
  - Make a new module that can create new random passwords and save those to Key Vault.
- Add protection mechanisms against accidental deletion of the Postgres instance if environment is production environment.

To get started, go to to the `terraform` directory and run `terraform init`.
After making changes to the Terraform code, run `terraform validate` to check that the code is valid.

## Deliverables

During the technical interview, you will be asked to present your code changes and explain your design choices via screenshare.
`terraform validate` should pass and the code should be clean and easy to read.

Not evaluated:

- Not expected to run the code against real Azure backend. `terraform plan` and `terraform apply` testing is not required.
