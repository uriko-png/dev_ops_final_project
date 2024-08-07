FROM python:3.7-slim
WORKDIR /app
RUN pip install pipenv
COPY Pipfile Pipfile.lock ./
RUN pipenv install --deploy --ignore-pipfile
COPY . .
EXPOSE 5000
CMD ["pipenv", "run", "python", "app.py"]
