-- Criar usuário com senha
CREATE ROLE novo_usuario WITH LOGIN PASSWORD 'sua_senha_segura';

-- Conceder permissões
grant all on <tabela> to <usuario>
GRANT ALL ON TABLE public.factstaticindicators TO gabriel_ds;

-- tirar as permissões
revoke select on <tabela> to <usuario>

-- ALterar a senha
ALTER USER nome_usuario WITH PASSWORD 'nova_senha';

-- Copiar as permissões de um usuário para Outro
DECLARE
    obj record;
BEGIN
    FOR obj IN
        SELECT 'GRANT ' || privilege_type || ' ON ' || table_schema || '.' || table_name || ' TO novo_usuario;'
        FROM information_schema.role_table_grants
        WHERE grantee = 'usuario_existente'
    LOOP
        EXECUTE obj;
    END LOOP;
END;

1. Conceder permissão para criar tabelas em um esquema específico
GRANT CREATE ON SCHEMA public TO usuario;

2. Conceder permissão de conexão ao banco (se necessário)
GRANT USAGE, CREATE ON SCHEMA public TO usuario;

3. Conceder todas as permissões no esquema (opcional)
Se o usuário precisar de mais permissões dentro do esquema:
GRANT USAGE, CREATE ON SCHEMA public TO usuario;
🔹 USAGE → Permite acessar o esquema.
🔹 CREATE → Permite criar tabelas e outros objetos dentro do esquema.


