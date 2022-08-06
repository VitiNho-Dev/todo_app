import 'package:flutter/material.dart';

import '../../../../../theme/app_text_style.dart';

class InitialContent extends StatelessWidget {
  const InitialContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.60,
        child: Column(
          children: [
            Text(
              'Você ainda não tem items 🙁',
              textAlign: TextAlign.center,
              style: AppTextStyle.titleBodyInitialState,
            ),
            const SizedBox(height: 32),
            Text(
              'Clique no botão abaixo para adicionar um item',
              textAlign: TextAlign.center,
              style: AppTextStyle.titleBody,
            ),
          ],
        ),
      ),
    );
  }
}
