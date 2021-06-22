# gigops-workspace-api
GigOps Workspace API

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Prerequisites

- [NestJS](https://nestjs.com/)
- Python 3.8
- MySQL 8

## Setup MySQL

Create a database and runt the follwoing scripts.
1. db/gigops-wsapi.sql
2. db/sample-data.sql

## Installation

```bash
$ npm install
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## How to obtain Bearer Token

The basic instruction is described in the following article.
- https://developer.okta.com/blog/2021/02/22/first-nestjs-application#testing-your-nestjs-application

Sample Postman configuration:
- docs/gigops-ws.postman_collection.json

Test user in Okta prepared for the development. You can use your own Okta.
- username : tc-dev+user1@tc3.co.jp
- password : Topcoder123

