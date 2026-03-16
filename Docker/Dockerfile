FROM aschreuder/backstage-infrastructure:latest

# Set a working directory
WORKDIR /app

# Create non-root user for security best practices
RUN addgroup -g 1000 appgroup && \
    adduser -D -u 1000 -G appgroup appuser && \
    chown -R appuser:appgroup /app

# Add the option for custom files 
# COPY --chown=appuser:appgroup src/ /app/

# Switch to non-root user
USER appuser

# Expose port 8000 to server HTTP traffic
EXPOSE 8000

# Run the application
COPY --chown=appuser:appgroup . /app/
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]