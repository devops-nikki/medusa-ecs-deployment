resource "aws_ecs_cluster" "main" {
  name = "${var.app_name}-cluster"
}

resource "aws_ecs_task_definition" "medusa" {
  family                   = "medusa-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name      = "medusa",
      image     = "${aws_ecr_repository.medusa.repository_url}:latest",
      essential = true,
      portMappings = [{
        containerPort = 9000
        protocol      = "tcp"
      }],
      environment = [
        {
          name  = "NODE_ENV"
          value = "production"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "service" {
  name            = "${var.app_name}-service"
  cluster         = aws_ecs_cluster.main.id
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.medusa.arn
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.subnet.id]
    assign_public_ip = true
    security_groups = [aws_security_group.sg.id]
  }
}