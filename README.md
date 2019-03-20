# Interactive Katacoda Scenarios

[![](http://shields.katacoda.com/katacoda/sgandon/count.svg)](https://www.katacoda.com/sgandon "Get your profile on Katacoda.com")

Visit https://www.katacoda.com/sgandon to view the profile and interactive scenarios

### Writing Scenarios
Visit https://www.katacoda.com/docs to learn more about creating Katacoda scenarios

For examples, visit https://github.com/katacoda/scenario-example

### maintaining the helm registry
the registry is built statically using github pages
see this [helm document](https://github.com/helm/helm/blob/master/docs/chart_repository.md#github-pages-example) for more details.
The registry can be found here : https://sgandon.github.io/katacoda-scenarios/

In order to add a new chart you need to :
$ helm package mychart
$ cp mychart-0.1.0.tgz docs
$ helm repo index docs --url https://sgandon.github.io/katacoda-scenarios/
$ git add -i
$ git commit -av
$ git push origin master