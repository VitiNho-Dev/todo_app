import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/components/custom_app_bar_widget.dart';
import '../../../../../shared/components/custom_floating_action_button.dart';
import '../../../../../shared/components/custom_show_dialog_widget.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../../theme/app_text_style.dart';
import '../../item_presenter/page_items/widgets/initial_content_widget.dart';
import '../lists_bloc/bloc/lists_bloc.dart';
import '../lists_bloc/bloc_states/lists_bloc_states.dart';
import 'components/card_list_widget.dart';

class PageLists extends StatefulWidget {
  const PageLists({Key? key}) : super(key: key);

  @override
  State<PageLists> createState() => _PageListsState();
}

class _PageListsState extends State<PageLists> {
  final bloc = Modular.get<ListsBloc>();
  final controllerTitle = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(),
      body: BlocBuilder<ListsBloc, ListsBlocState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ListsInitialBlocState) {
            return const InitialContent();
          }
          if (state is ListsLoadingBlocState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ListsErrorBlocState) {
            return const Center(
              child: Text('Aconteceu um erro!'),
            );
          }
          if (state is ListsSuccessBlocState) {
            var result = state.listItems;
            return Padding(
              padding: const EdgeInsets.only(left: 32, top: 24, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suas Listas',
                    style: AppTextStyle.titleBody,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        var data = result[index];
                        return CardListWidget(
                          name: data.name,
                          description: data.description,
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => showModalBottomSheet<String>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return BlocBuilder<ListsBloc, ListsBlocState>(
              bloc: bloc,
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: CustomShowBottomSheetWidget(
                    text: 'Adicione uma nova lista',
                    controller: controllerTitle,
                    addItem: () {
                      controllerTitle.clear();
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
