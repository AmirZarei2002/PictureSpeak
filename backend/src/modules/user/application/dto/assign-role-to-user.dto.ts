import { IsNotEmpty, IsString } from 'class-validator';

export class AssignRoleToUserDto {
  @IsString()
  @IsNotEmpty()
  roleId: string;
}
