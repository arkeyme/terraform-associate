# Debugging terraform

It can be enabled by using TF_LOG variables in environment

Possible values is: `TRACE`, `DEBUG`, `INFO`, `WARN` or `ERROR`.   
`TF_LOG_PATH` to store debug log.

In git bash:

```
echo $PATH:/c/ProgramData/chocolatey/bin/
export TF_LOG=debug
export TF_LOG_PATH=./debug.log
terraform plan
```

There is new file `debug.log` will be created.

to validete terraform file:

```terraform validate```