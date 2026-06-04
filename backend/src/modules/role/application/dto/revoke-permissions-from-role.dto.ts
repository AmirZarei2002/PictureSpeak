import { IsNotEmpty } from 'class-validator';

export class RevokePermissionsFromRoleDto {
  @IsNotEmpty()
  permissions: string[];
}
