require 'csv'

namespace :import do
  task data: :environment do
    import_lawyers
    import_clients
    import_courts
    import_cases
  end

  def import_lawyers
    puts 'Importing lawyers'

    CSV.foreach('data/lawyers.csv', col_sep: ';', headers: true) do |row|
      Lawyer.find_or_create_by!(
        ssn: row[0],
        name: row[1]
      )
    end
  end

  def import_clients
    puts 'Importing clients'

    CSV.foreach('data/clients.csv', col_sep: ';', headers: true) do |row|
      Client.find_or_create_by!(
        ssn: row[0],
        name: row[1]
      )
    end
  end

  def import_courts
    puts 'Importing courts'

    CSV.foreach('data/courts.csv', col_sep: ';', headers: true) do |row|
      Court.find_or_create_by!(
        id: row[0],
        name: row[1],
        address: row[2]
      )
    end
  end

  def import_cases
    puts 'Importing cases'

    CSV.foreach('data/cases.csv', col_sep: ';', headers: true) do |row|
      lawyer = Lawyer.find_by!(ssn: row['Lawyer ssn'])
      client = Client.find_by!(ssn: row['Client ssn'])
      court = Court.find_by!(id: row['Court ID'])

      Case.find_or_create_by!(
        id: row['Case ID'],
        lawyer: lawyer,
        client: client,
        court: court,
        value: row['Case Value'],
        status: row['Case Status'],
        case_date: row['Case Date']
      )
    end
  end
end
