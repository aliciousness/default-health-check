# rickroll
[![Docker Pulls](https://img.shields.io/badge/Docker%20Pulls-1321-blue)](https://hub.docker.com/r/aliciousness/rickroll)
[![Latest Release](https://img.shields.io/badge/release-v2.0.5-brightgreen)](https://github.com/aliciousness/ACTION-latest-release-badge/releases)
[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/aliciousness)
<!-- [![Docker Image Size (tag)]() -->
<!-- ![Build Status](https://img.shields.io/github/actions/workflow/status/aliciousness/rickroll/release.yml?branch=main)]
[![GitHub last commit](https://img.shields.io/badge/Last%20Commit-2024-11-08-yellow)] -->

A Rickroll docker image using [this html](https://github.com/ShatteredDisk/rickroll)

## Installation

To install the images, clone the repository:

```sh
git clone https://github.com/aliciousness/rickroll.git
```
**OR**
Use the public docker image found [here](https://hub.docker.com/r/aliciousness/rickroll)

Image is based on nginxinc/nginx-unprivileged, and all the content is local to the container.

# Container Screenshot

![image](https://user-images.githubusercontent.com/4349962/187975538-9b7ec5db-3cf4-4dfa-964c-019eba9e272f.png)

# Tags
| Tag | Description |
| :----: | --- |
| latest | Video starts automatically. 1080p AI remaster. |
| version | Just a version of latest to pin|

# Environment Variables
| Variable | Description | Default |
| :----: | --- | --- |
| PORT | Changes the port nginx is listening on. | 8080 |
| HEALTH_CHECK_PATH | The path you want to use for the health check | health |

## Usage
You can use these images by including them in your projects or sharing them as you like. Here are some examples:

```yaml
version: "2.4"
services:
  rickroll:
    image: aliciousness/rickroll:<latest/version>
    container_name: Rickroll
    ports:
      - 1234:1234
    environment:
      PORT: 1234 # Set any environment variable if needed by the application
      HEALTH_CHECK_PATH: /health/check # Set the health check path
```

To set a new release of the image you will need to fork the repo set the GH variable/secrets DOCKERHUB_USERNAME and DOCKERHUB_TOKEN
and create a new GH release with a tagged version that will trigger the workflow

## Contribution
We welcome contributions! Here are some guidelines to get started:

Fork the repository.
Create a new branch for your feature or bugfix: git checkout -b my-feature-branch
Commit your changes: git commit -m 'Add new feature'
Push to the branch: git push origin my-feature-branch
Create a pull request.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

You can now edit the README.md file and replace its content with the above sections.
