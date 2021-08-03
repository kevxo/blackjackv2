class HomeController < ApplicationController
  def index
    @members = [{ 'name': 'Jose Lopez', 'linkedin': 'https://www.linkedin. com/in/jose-lopez-0551a01a1/', 'github':
      'https://github.com/JoseLopez235', 'image': 'https://lh3.googleusercontent.com/LfJSiStL3LcCNA7_B1uCiu6AvTQGNMPbd-KagzcUWGWTNdRI-5yTGSclAm0Seo3j0OYAvyuyfoM7t5yLB5wu0sw0zA14whCLAzzE_Wo2uIfbfKqKvUs0g4F4Aiu05EGhLbRJy7hq0Q=s240-p-k' },
      { 'name': 'Kevin Cuadros', 'linkedin': 'https://www.linkedin.com/in/kevin-cuadros-2bb4551a1/',
        'github': 'https://github.com/kevxo', 'image': 'https://lh3.googleusercontent.com/8aaVC9AAKx2IvxTTkkm-Xb1kQ6Jb-tPLsCeeqFcYj0K3BUBRTyKDetOP6FHvl7KzZ_b1uJ-gFoa2JnHxUz_eotyZgpEPVT-OY-DMG9c-bY0YtARYtcQqFRQqEY8aQbOFmIF1bi6bJw=w2400' },
      {'name': 'Robert Basulto', 'linkedin': 'https://www.linkedin.com/in/roberto-basulto/', 'github': 'https://github.com/Eternal-Flame085', 'image': 'https://lh3.googleusercontent.com/KXnKrW-B9S0tvyHaSluPFv0NWyZzVFzXY-HxUnJFU94WTlwFgFh1FEEhPJsNB5pOLe2GRLyEuwOFgkFkH6wPabUJRMYiBc1sGuEMWC1WJIEi9Bp_jtEYWoZjQyvs4ZQhmHzCbIZohw=w2400'}]
  end
end
