import 'package:calculator/materials/pages/todo/todoFunction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoServices {
  static const String _todoListKey = 'todoList';

  Future<void> saveTodos(List<Todofunction> todos) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> jsonList = todos.map((todo) => todo.toJson()).toList();
    await pref.setStringList(_todoListKey, jsonList);
  }

  Future<List<Todofunction>> loadTodo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? jsonList = pref.getStringList(_todoListKey);

    if (jsonList != null) {
      return jsonList.map((json) => Todofunction.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<void> addTodo(Todofunction todo) async {
    List<Todofunction> todoList = await loadTodo();
    todoList.add(todo);
    await saveTodos(todoList);
  }

  Future<void> removeTodoById(int id) async{
    List<Todofunction> todos = await loadTodo();
    todos.removeWhere((todo) => todo.id == id);
    await saveTodos(todos);
  }

  Future<void> updateTodo(Todofunction updatedTodo) async{
    List<Todofunction> todos = await loadTodo();
    int index = todos.indexWhere((todo) => todo.id == updatedTodo.id);
    if(index != -1){
      todos[index] = updatedTodo;
      await saveTodos(todos);
    }
  }
}
