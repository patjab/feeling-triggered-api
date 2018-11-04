class CreateInitialFeelingsTrigger < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
        CREATE FUNCTION initial_feelings() RETURNS trigger AS $initial_feelings$
            BEGIN
              INSERT INTO Feelings (title, description, user_id, created_at, updated_at)
              VALUES
              ('Stressed', '1000 labs per second', NEW.id, NOW(), NOW());
              RETURN NULL;
            END;
        $initial_feelings$ LANGUAGE plpgsql;

        CREATE TRIGGER initial_feelings
          AFTER INSERT ON users
          FOR EACH ROW
          EXECUTE PROCEDURE initial_feelings();
    SQL
  end

  def down
    execute <<-SQL
      DROP TRIGGER initial_feelings ON users;
    SQL
  end
end
