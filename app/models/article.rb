class Article < ApplicationRecord
  #draft:  記事が下書きの状態
  #published: 記事が公開された状態
    enum status: { draft: 0, published: 1}

    #20文字以上の記事タイトルを省略する
  def abbreviated_title
    title.size >= 20 ? "#{title.slice(0,19)}..." : title
  end
  # 記事を公開する
  def publish
    return if self.published?
    update({status: Article.statuses['published'], published_at: Time.current})
  end

end
