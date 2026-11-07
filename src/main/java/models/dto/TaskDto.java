package models.dto;

import models.enums.TaskStatus;

import java.time.LocalDateTime;

public record TaskDto(
         Long taskId,
         Long userId,
         String title,
         String desc,
         LocalDateTime createdAt,
         LocalDateTime completedAt,
         LocalDateTime startsAt,
         LocalDateTime deadline,
         TaskStatus status
) {
}
