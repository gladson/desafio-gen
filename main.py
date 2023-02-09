import json
import os
from urllib.error import URLError
from urllib.request import urlretrieve
from operator import itemgetter
from pathlib import Path, PurePath


class SavePosterAndBackdrop:
    def __init__(self):
        self.url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/"

    def get_images_poster_backdrop(self):
        try:
            list_images = []
            with open(
                os.path.join("mock.json"), "r", encoding="utf-8"
            ) as image_file:
                mock_data = json.load(image_file)
            for images in mock_data["mcu"]:
                backdrop, poster = itemgetter(
                    "backdrop_path",
                    "poster_path",
                )(images)
                list_images.extend(
                    [backdrop.replace("/", ""), poster.replace("/", "")]
                )
            self.save_image(list_images)
        except Exception as e:
            raise RuntimeError("ERROR: '{}'".format(e.reason))

    def save_image(self, list_images: list):
        try:
            counter = 0
            for str_image in list_images:
                urlretrieve(
                    self.url + str_image,
                    Path().cwd()
                    / PurePath(
                        "images",
                        str_image,
                    ),
                )
                counter += 1
                print("SUCCESS: ", str_image, counter)
        except URLError as e:
            raise RuntimeError("ERROR: '{}'. '{}'".format(self.url, e.reason))


if __name__ == "__main__":
    SavePosterAndBackdrop().get_images_poster_backdrop()
