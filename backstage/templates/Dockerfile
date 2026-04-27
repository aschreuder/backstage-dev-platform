{% if values.language == "Python" %}
FROM python:3.11-slim
{% elif values.language == "Go" %}
FROM golang:1.21-alpine
{% elif values.language == "Java" %}
FROM eclipse-temurin:17-jdk
{% else %}
FROM node:20-slim
{% endif %}

WORKDIR /app