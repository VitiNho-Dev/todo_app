import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/components/custom_app_bar_widget.dart';
import '../../../../shared/components/custom_floating_action_button.dart';
import '../../../../shared/components/custom_show_dialog_widget.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_style.dart';
import '../../domain/entities/item_entity.dart';
import '../item_bloc/bloc/item_bloc.dart';
import '../item_bloc/bloc_events/item_bloc_events.dart';
import '../item_bloc/bloc_states/bloc_states.dart';
import 'widgets/custom_list_items.dart';

class PageTodo extends StatefulWidget {
  const PageTodo({Key? key}) : super(key: key);

  @override
  State<PageTodo> createState() => _PageTodoState();
}

class _PageTodoState extends State<PageTodo> {
  final bloc = Modular.get<ItemBloc>();

  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    String title = '';
    final controller = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(),
      body: BlocBuilder<ItemBloc, ItemBlocState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is InitialBlocState) {
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
          var result = (state as SuccessBlocState).items;
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
                            DeleteItemBlocEvent(result[index]),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Item excluido com sucesso!'),
                            ),
                          );
                        },
                        child: CustomListItems(
                          onTap: () {
                            item.check = !item.check;
                            bloc.add(
                              UpdateItemBlocEvent(
                                Item(
                                  title: item.title,
                                  check: item.check,
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
                    controller: controller,
                    onChanged: (value) {
                      title = value;
                    },
                    addItem: () {
                      controller.clear();
                      bloc.add(
                        AddItemBlocEvent(
                          Item(
                            title: title,
                            check: false,
                            id: '',
                            createAt: DateTime.now(),
                          ),
                        ),
                      );
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
