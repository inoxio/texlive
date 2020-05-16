This dockerimage is suppose to build your latex project without installing any dependencies.
It is quite big because it simply contains everything there is. Should work out of the box.

# Usage

Simply change into the directory where you `main.tex` file is located and execute:

```shell script
docker run -v `pwd`:/data \
       mkunze/texlive-basic:2020.19 \
       pdflatex --admin main.tex
```
or
```shell script
docker run -v `pwd`:/data \
       mkunze/texlive-full:2020.19 \
       pdflatex --admin main.tex
```

See https://hub.docker.com/repository/docker/mkunze/texlive-full/tags for list of all tags.
Each week a new image is being build. Version number is `year.calendarweek`.

You can also use it in your gitlab `.gitlab-ci.yml` pipeline if needed:

```yaml
job-name:
  stage: stage-name
  image: mkunze/texlive-[basic|full]:2020.19
  script:
    - pdflatex main.tex
```
