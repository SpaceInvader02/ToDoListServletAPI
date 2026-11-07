CREATE TYPE TASK_STATUS as ENUM('DONE', 'PENDING');

CREATE TABLE users (
    user_id BIGSERIAL NOT NULL ,
    username VARCHAR(40) NOT NULL ,
    password_hash VARCHAR(255) NOT NULL ,

    CONSTRAINT users_user_id_pk PRIMARY KEY (user_id) ,
    CONSTRAINT users_username_uq UNIQUE (username) ,
    CONSTRAINT users_username_not_blank_chk
        CHECK (length(trim(username)) > 0)
);

CREATE TABLE tasks (
    task_id BIGSERIAL NOT NULL ,
    user_id BIGINT NOT NULL ,
    title VARCHAR(80) NOT NULL ,
    description TEXT ,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP ,
    starts_at TIMESTAMP ,
    deadline TIMESTAMP ,
    status TASK_STATUS NOT NULL DEFAULT 'PENDING' ,

    CONSTRAINT tasks_task_id_pk PRIMARY KEY (task_id) ,
    CONSTRAINT tasks_user_id_fk FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ,
    CONSTRAINT tasks_completed_at_chk CHECK ( completed_at >= created_at ) ,
    CONSTRAINT tasks_deadline_starts_at_chk CHECK ( deadline >= starts_at) ,
    CONSTRAINT tasks_deadline_created_at CHECK (deadline >= created_at) ,
    CONSTRAINT tasks_title_not_blank_chk
        CHECK (length(trim(title)) > 0) ,
    CONSTRAINT tasks_status_chk CHECK ( (status = 'DONE' AND completed_at IS NOT NULL) OR (status = 'PENDING' AND completed_at IS NULL))
);