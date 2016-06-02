require 'spec_helper'

describe GoogleImages::Mapper do
  let(:hash) do
    {
      "items"=>[
        {
          "kind"=>"customsearch#result",
          "title"=>"Which Superstar Poker Pro Are You? | PlayBuzz",
          "htmlTitle"=>"Which Superstar <b>Poker</b> Pro Are You? | PlayBuzz",
          "link"=>"http://www.christchurchcasino.co.nz/uploads/images/gallery/20/poker1.jpg",
          "displayLink"=>"www.playbuzz.com",
          "snippet"=>"Which Superstar Poker Pro Are",
          "htmlSnippet"=>"Which Superstar <b>Poker</b> Pro Are",
          "mime"=>"image/jpeg",
          "image"=> {
            "contextLink"=>"http://www.playbuzz.com/rickwaverley10/which-superstar-poker-pro-are-you",
            "height"=>565,
            "width"=>849,
            "byteSize"=>66784,
            "thumbnailLink"=>"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTQe2ADIvsFbTua-AgnYS8z12bFTcKwIHyoNH7tV6P1tqjwTCrt8oNBf_8",
            "thumbnailHeight"=>96,
            "thumbnailWidth"=>145
           }
        },
        {
          "kind"=>"customsearch#result",
          "title"=>"Gamification Research in Poker Suggests Artificial Intelligence ...",
          "htmlTitle"=>"Gamification Research in <b>Poker</b> Suggests Artificial Intelligence <b>...</b>",
          "link"=>"http://www.gamification.co/wp-content/uploads/2015/10/Poker_cards_and_chips.jpg",
          "displayLink"=>"www.gamification.co",
          "snippet"=>"Gamification Research in Poker",
          "htmlSnippet"=>"Gamification Research in <b>Poker</b>",
          "mime"=>"image/jpeg",
          "image"=> {
            "contextLink"=>"http://www.gamification.co/2015/10/23/gamification-research-in-poker-suggests-artificial-intelligence-applications/",
            "height"=>412,
            "width"=>620,
            "byteSize"=>64458,
            "thumbnailLink"=>"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPseEG9EGbuJGkjTUW6omWeNnEH05A51c9WjAFOnwlUlHHz7GYIdw9JRU",
            "thumbnailHeight"=>90,
            "thumbnailWidth"=>136
          }
        }
      ]
    }
  end

  it 'builds image objects' do
    images = described_class.build_images(hash)

    expect(images.size).to eq(2)
    expect(images).to all(be_kind_of(GoogleImages::Image))
  end
end
