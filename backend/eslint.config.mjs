// @ts-check
import eslint from '@eslint/js';
import eslintPluginPrettierRecommended from 'eslint-plugin-prettier/recommended';
import importPlugin from 'eslint-plugin-import';
import globals from 'globals';
import tseslint from 'typescript-eslint';

export default tseslint.config(
  {
    ignores: ['eslint.config.mjs'],
  },
  eslint.configs.recommended,
  ...tseslint.configs.recommendedTypeChecked,
  eslintPluginPrettierRecommended,
  {
    languageOptions: {
      globals: {
        ...globals.node,
        ...globals.jest,
      },
      ecmaVersion: 5,
      sourceType: 'module',
      parserOptions: {
        projectService: true,
        tsconfigRootDir: import.meta.dirname,
      },
    },
  },
  {
    plugins: {
      import: importPlugin,
    },
    settings: {
      'import/resolver': {
        typescript: {
          alwaysTryTypes: true,
          project: './tsconfig.json',
        },
        node: true,
      },
      'import/parsers': {
        '@typescript-eslint/parser': ['.ts', '.tsx'],
      },
    },
    rules: {
      '@typescript-eslint/no-explicit-any': 'off',
      '@typescript-eslint/no-floating-promises': 'warn',
      '@typescript-eslint/no-unsafe-argument': 'warn',

      'no-restricted-imports': [
        'error',
        {
          patterns: [
            {
              group: ['src/*'],
              message:
                'Use path aliases (@common, @shared, @modules, etc.) instead of "src/" imports',
            },
            {
              group: ['**/infrastructure/prisma/**'],
              message:
                'Do not import directly from infrastructure layer. Use barrel exports from application or domain layer.',
            },
            {
              group: ['**/infrastructure/**'],
              message:
                'Infrastructure imports should be internal to the module. Use public APIs through barrel exports.',
            },
          ],
        },
      ],

      'import/order': [
        'error',
        {
          groups: [
            'builtin',
            'external',
            'internal',
            'parent',
            'sibling',
            'index',
          ],
          pathGroups: [
            {
              pattern: '@nestjs/**',
              group: 'external',
              position: 'before',
            },
            {
              pattern: '@common/**',
              group: 'internal',
              position: 'before',
            },
            {
              pattern: '@shared/**',
              group: 'internal',
              position: 'before',
            },
            {
              pattern: '@config/**',
              group: 'internal',
              position: 'before',
            },
            {
              pattern: '@prisma/**',
              group: 'internal',
              position: 'before',
            },
            {
              pattern: '@modules/**',
              group: 'internal',
              position: 'before',
            },
            {
              pattern: '@*/**',
              group: 'internal',
              position: 'before',
            },
          ],
          pathGroupsExcludedImportTypes: ['builtin'],
          'newlines-between': 'never',
          alphabetize: {
            order: 'asc',
            caseInsensitive: true,
          },
        },
      ],

      'import/no-relative-parent-imports': 'off',

      'import/first': 'error',

      'import/newline-after-import': 'error',

      'import/no-duplicates': 'error',
    },
  },
  {
    files: ['src/modules/**/**.module.ts'],
    rules: {
      'no-restricted-imports': [
        'error',
        {
          patterns: [
            {
              group: ['src/*'],
              message:
                'Use path aliases (@common, @shared, @modules, etc.) instead of "src/" imports',
            },
          ],
        },
      ],
    },
  },
  {
    files: ['**/*.spec.ts', '**/*.test.ts', '**/test/**/*.ts'],
    rules: {
      'no-restricted-imports': 'off',
    },
  },
);