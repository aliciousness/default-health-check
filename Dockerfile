FROM nginxinc/nginx-unprivileged:1.29-bookworm
LABEL maintainer="Richard Craddock craddock9richard@gmail.com"
LABEL version=$VERSION
ARG VERSION
ENV VERSION=${VERSION}
USER root
COPY --link --chmod=755 --chown=nginx:root entrypoint /entrypoint
COPY --link --chmod=644 --chown=nginx:nginx index.html /usr/share/nginx/html/index.html
RUN apt update && apt install -y libcap2-bin \
  && chown -R nginx:nginx /usr/share/nginx/html
RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/nginx
USER nginx
CMD ["sh", "entrypoint"]
