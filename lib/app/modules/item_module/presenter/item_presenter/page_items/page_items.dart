import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/components/custom_app_bar_widget.dart';
import '../../../../../shared/components/custom_floating_action_button.dart';
import '../../../../../shared/components/custom_show_dialog_widget.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../../theme/app_text_style.dart';
import '../../../domain/entities/item_entity.dart';
import '../item_bloc/bloc/item_bloc.dart';
import '../item_bloc/bloc_events/item_bloc_events.dart';
import '../item_bloc/bloc_states/bloc_states.dart';
import 'widgets/custom_list_items.dart';
import 'widgets/initial_content_widget.dart';

class PageItems extends StatefulWidget {
  final String idList;
  const PageItems({Key? key, required this.idList}) : super(key: key);

  @override
  State<PageItems> createState() => _PageItemsState();
}

class _PageItemsState extends State<PageItems> {
  final bloc = Modular.get<ItemBloc>();
  final controllerTitle = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.id = widget.idList;
    bloc.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(),
      body: BlocBuilder<ItemBloc, ItemBlocState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is InitialBlocState) {
            return const InitialContent();
          }
          if (state is LoadingBlocState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorBlocState) {
            return const Center(
              child: Text('Aconteceu um erro!'),
            );
          }
          if (state is SuccessBlocState) {
            var result = state.items;
            return Padding(
              padding: const EdgeInsets.only(left: 32, top: 24, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Compras',
                    style: AppTextStyle.titleBody,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        var item = result[index];
                        return Dismissible(
                          direction: DismissDirection.startToEnd,
                          background: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.only(left: 6),
                            color: const Color(0xFFF44336),
                            alignment: Alignment.centerLeft,
                            child: const Icon(
                              Icons.cancel,
                              color: AppColors.appBarTextColor,
                            ),
                          ),
                          key: ValueKey<Item>(result[index]),
                          onDismissed: (DismissDirection direction) {
                            bloc.add(
                              DeleteItemBlocEvent(
                                result[index],
                                widget.idList,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Item excluido com sucesso!'),
                              ),
                            );
                          },
                          child: CustomListItems(
                            onTap: () {
                              bloc.add(
                                UpdateItemBlocEvent(
                                  Item(
                                    title: item.title,
                                    check:
                                        item.copyWith(check: !item.check).check,
                                    id: item.id,
                                    createAt: item.createAt,
                                  ),
                                ),
                              );
                            },
                            ictemCount: result,
                            title: item.title,
                            check: item.check,
                          ),
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
            return BlocBuilder<ItemBloc, ItemBlocState>(
              bloc: bloc,
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: CustomShowBottomSheetWidget(
                    text: 'Adicione um item na sua lista',
                    controller: controllerTitle,
                    addItem: () {
                      bloc.add(
                        AddItemBlocEvent(
                          Item(
                            title: controllerTitle.text,
                            id: '',
                            createAt: DateTime.now(),
                          ),
                          widget.idList,
                        ),
                      );
                      controllerTitle.clear();
                      Modular.to.pop();
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
