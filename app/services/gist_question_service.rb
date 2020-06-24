class GistQuestionService

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client 
  end

  def call
    @answer = @client.create_gist(gist_params)
  end

  def success?
    !@answer.html_url.nil?  
  end

  private

  def gist_params
    {
      description: I18n.t(".description", test: "#{@test.title}"), 
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.wording]
    content += @question.answers.pluck(:wording)
    content.join("\n")
  end

  def default_client
    Octokit::Client.new(:access_token => ENV['GIST_TOKEN'])
  end

end