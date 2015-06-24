FROM patrickod/tor
MAINTAINER Mark Percival <m@mdp.im>

RUN mkdir -p /var/lib/tor/hidden_service
RUN chown -R root:root /var/lib/tor
RUN chmod -R 600 /var/lib/tor/hidden_service
VOLUME /var/lib/tor/hidden_service

ADD ./torrc /etc/torrc
ADD ./start-tor /bin/start-tor

CMD /bin/start-tor
