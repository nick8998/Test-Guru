class GistQuestionService

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['GIST_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?(answer)
    if answer.html_url.nil?
      false
    else
      true
    end  
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
    nil
  end

end