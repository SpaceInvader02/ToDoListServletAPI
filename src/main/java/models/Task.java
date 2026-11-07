package models;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import models.enums.TaskStatus;

import java.time.LocalDateTime;

@Builder
@Getter
@Setter
public class Task {
    private Long taskId;
    private Long userId;
    private String title;
    private String desc;
    private LocalDateTime createdAt;
    private LocalDateTime completedAt;
    private LocalDateTime startsAt;
    private LocalDateTime deadline;
    private TaskStatus status;
}
