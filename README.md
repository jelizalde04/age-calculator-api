# Age Calculation API (Ruby)

This is a simple API that calculates a person's age in years, months, and days based on their birth date.

## Endpoints

### GET /calculate_age

- **Parameters**:
  - `birthdate` (required): Date of birth in `YYYY-MM-DD` format.

- **Example Request**:
GET /calculate_age?birthdate=1995-06-15

## Using Docker

1. Build the Docker image:

    docker build -t age-calculation-api .

2. Run the Docker container:

    docker run -p 4567:4567 age-calculation-api

3. Access the API at http://localhost:4567/calculate_age?birthdate=YYYY-MM-DD
