# Contributing guidelines

## env setup

You should have the following tools installed on your development machine:

- [tfenv](https://github.com/tfutils/tfenv)
- [pre-commit](https://pre-commit.com)
- [terraform-docs](https://terraform-docs.io/)
- [tflint](https://github.com/terraform-linters/tflint)
- [tfsec](https://github.com/aquasecurity/tfsec)
- [markdownlint](https://github.com/igorshubovych/markdownlint-cli)
- [markdown-link-check](https://github.com/tcort/markdown-link-check)
- [shellcheck](https://github.com/koalaman/shellcheck)
- [typos](https://github.com/crate-ci/typos)

Remember to run below command for the hooks to trigger on every commit.

```shell
pre-commit install
pre-commit install --install-hooks
```

## Static analysis

Static analysis against Terraform configuration can be performed by running the following command
```
make test
```

## Contributing a patch

1. Submit an issue describing the proposed change to the repo in question.
2. The [repo owners](CODEOWNERS) will respond
3. Fork the repo, develop and test your code changes.
4. Submit a pull request.
5. Work with the reviewers on their suggestions.
6. Ensure to rebase to the HEAD of your target branch and squash un-necessary commits before the final merge
