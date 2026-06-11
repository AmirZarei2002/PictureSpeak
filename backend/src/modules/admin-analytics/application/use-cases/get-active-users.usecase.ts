import { Injectable } from '@nestjs/common';
import { ActiveUsersEntity } from '@modules/admin-analytics/domain/entities/active-users.entity';
import { IActiveUsersRepository } from '@modules/admin-analytics/domain/interfaces/analytics.repository.interface';
import { ActiveUsersQueryDto } from '../dtos/active-users-query.dto';

@Injectable()
export class GetActiveUsersUseCase {
  constructor(private readonly repository: IActiveUsersRepository) {}

  execute(query: ActiveUsersQueryDto): Promise<ActiveUsersEntity> {
    return this.repository.getActiveUsers(query.days ?? 30);
  }
}
