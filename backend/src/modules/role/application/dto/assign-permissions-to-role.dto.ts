import { IsNotEmpty } from 'class-validator';

export class AssignPermissionsToRoleDto {
  @IsNotEmpty()
  permissions: string[];
}
