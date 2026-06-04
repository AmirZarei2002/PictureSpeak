import { PermissionSeed } from '../types/permission-seed.type';

const permissionNames = [
  'user:list',
  'user:read',
  'user:assign-role',
  'user:revoke-role',
  'role:create',
  'role:update',
  'role:list',
  'role:read',
  'role:delete',
  'role:assign-permissions',
  'role:revoke-permissions',
  'permission:create',
  'permission:update',
  'permission:list',
  'permission:read',
  'permission:delete',
] as const;

export const permissions: PermissionSeed[] = permissionNames.map((name) => {
  const action = name.split(':')[1] ?? name;
  return { name, action };
});
