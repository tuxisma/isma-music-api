FROM tuxisma/centos7-python36:latest
LABEL maintainer Ismael Garcia "tuxisma@gmail.com"

RUN adduser -c "flask user" -m -u 5001 -d "/app" flask

COPY . /app

RUN rm -rf /.venv 2> /dev/null || exit 0 && \
    cp -v /app/Pipfile / && \
    cp -v /app/Pipfile.lock / && \
    pushd / && \
      pipenv --three install --dev --ignore-pipfile && \
    popd && \
    rm -v /Pipfile /Pipfile.lock && \
    chmod -R 0770 /app && \
    chown -R flask.root /app /.venv

USER 5001
EXPOSE 5001

CMD ["/.venv/bin/gunicorn", "-b", "0.0.0.0:5001", "music:app"]
