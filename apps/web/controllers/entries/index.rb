module Web::Controllers::Entries
  class Index
    include Web::Action

    expose :entries
    expose :sort

    def call(params)

      @sort = params[:sort]
      if @sort.downcase == 'asc' || @sort.downcase == 'ascending'
        @entries = EntryRepository.new.least_recent
      else
        @entries = EntryRepository.new.most_recent
      end
    end
  end
end
