namespace :company do
  task :rating_calculate => :environment do
    @companies = Company.all
    @companies = @companies.sort_by { |h| h.percent}.reverse!
    @companies.each_with_index  do |company,index|
      current_index =  index + 1
      unless (current_index == company.current_place)
        company.last_place = company.current_place
        company.current_place = current_index
      end
      company.save
    end
  end
end
