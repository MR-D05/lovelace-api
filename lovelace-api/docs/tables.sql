CREATE TABLE IF NOT EXISTS api_tokens (
    id int NOT NULL,
    token varchar,
    user_id int NOT NULL,
    created_at timestamp DEFAULT NULL,
    updated_at timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS users (
    id int NOT NULL,
    username varchar,
    password_hash varchar,
    reset_password_token varchar,
    reset_password_sent_at timestamp DEFAULT NULL,
    remember_created_at timestamp DEFAULT NULL,
    current_sign_in_at timestamp DEFAULT NULL,
    last_sign_in_at timestamp DEFAULT NULL,
    is_admin int DEFAULT NULL
);
