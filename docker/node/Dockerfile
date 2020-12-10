FROM node:14-alpine3.10
LABEL maintainer "seiyu-nico <yuseiishii141+docker@gmail.com>"

# RUN apk add font-ipa fontconfig && fc-cache -f
ENV user tech
RUN deluser --remove-home node && \
    adduser -u 1000 -h /home/${user} --disabled-password ${user} && \
    chown -R ${user}:${user} /home/${user}
WORKDIR /home/${user}/workspace
ENV NODE_ENV=development

COPY startup.sh /home/${user}/startup.sh
RUN chmod 744 /home/${user}/startup.sh && \
    chown -R ${user}:${user} /home/${user}/startup.sh
USER ${user}
CMD ["/home/tech/startup.sh"]