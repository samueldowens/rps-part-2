# connect to an in-memory database

  Sequel.migration do
    change do
      create_table(:games) do
        primary_key :id
        String :human_play
        String :computer_play
        Boolean :won
        Boolean :lost
        DateTime :created_at
      end
    end
  end