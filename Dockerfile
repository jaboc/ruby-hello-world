FROM openshift/ruby-20-centos

RUN gem install sinatra sinatra-activerecord mysql2 --no-ri --no-rdoc

ADD sinatra_app /tmp/

USER root

RUN chown -R ruby:ruby /tmp/*

USER ruby

WORKDIR /tmp/

EXPOSE 8080
CMD ["ruby", "start.rb"]
